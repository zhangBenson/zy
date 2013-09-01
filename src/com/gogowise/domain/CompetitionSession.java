package com.gogowise.domain;

import com.gogowise.utils.Constants;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class CompetitionSession extends AbstractPersistence {
    private String name;
    @ManyToOne
    private CompetitionPhase competitionPhase;
    private Double startTime;
    private Double endTime;
    @Temporal(TemporalType.DATE)
    private Date date;
    @Transient
    private Integer allocationUserId;// This user id use to get allocation type.

    @OneToMany(mappedBy = "competitionSession", cascade = CascadeType.ALL)
    private List<JudgeAllocation> judgeAllocations = new ArrayList<JudgeAllocation>();
    //    @OneToOne(cascade = CascadeType.ALL)
//    private JudgeAllocation judgeAllocation2 = new JudgeAllocation();
    @OneToOne(mappedBy = "competitionSession", cascade = CascadeType.ALL)
    private HostAllocation hostAllocation;

    @OneToMany(mappedBy = "competitionSession", cascade = CascadeType.ALL)
    private List<SingerAllocation> singerAllocations = new ArrayList<SingerAllocation>();

    @OneToMany(mappedBy = "competitionSession")
    private List<Allocation> allAllocations = new ArrayList<Allocation>();
    private Integer status;

//    @Formula("(select COUNT(*) from singerAllocation sa where sa.competitionSession_id = id and sa.singUpInfo_id is not null)")
//    private Integer allocatedNumber;

    {
        this.initAllocation();
    }

    public void initAllocation() {
        for (int i = 0; i < Constants.MAX_SINGER_SIZE && this.singerAllocations.size() < Constants.MAX_SINGER_SIZE; i++) {
            SingerAllocation sa = new SingerAllocation();
            sa.setCompetitionSession(this);
            singerAllocations.add(sa);
        }
        if (this.hostAllocation == null) {
            this.hostAllocation = new HostAllocation();
            this.hostAllocation.setCompetitionSession(this);
        }
        for (int i = 0; i < Constants.MAX_Judge_SIZE && this.judgeAllocations.size() < Constants.MAX_Judge_SIZE; i++) {
            JudgeAllocation ja = new JudgeAllocation();
            ja.setCompetitionSession(this);
            this.judgeAllocations.add(ja);
        }
    }

    public List<Allocation> getAllAllocations() {
        return allAllocations;
    }

    public void setAllAllocations(List<Allocation> allAllocations) {
        this.allAllocations = allAllocations;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CompetitionPhase getCompetitionPhase() {
        return competitionPhase;
    }

    public void setCompetitionPhase(CompetitionPhase competitionPhase) {
        this.competitionPhase = competitionPhase;
    }

    public Double getStartTime() {
        return startTime;
    }

    public void setStartTime(Double startTime) {
        this.startTime = startTime;
    }

    public Double getEndTime() {
        return endTime;
    }

    public void setEndTime(Double endTime) {
        this.endTime = endTime;
    }

    public List<JudgeAllocation> getJudgeAllocations() {
        return judgeAllocations;
    }

    public void setJudgeAllocations(List<JudgeAllocation> judgeAllocations) {
        this.judgeAllocations = judgeAllocations;
    }

    public HostAllocation getHostAllocation() {
        return hostAllocation;
    }

    public void setHostAllocation(HostAllocation hostAllocation) {
        this.hostAllocation = hostAllocation;
    }

    public List<SingerAllocation> getSingerAllocations() {
        return singerAllocations;
    }

    public void setSingerAllocations(List<SingerAllocation> singerAllocations) {
        this.singerAllocations = singerAllocations;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getAllocationUserId() {
        return allocationUserId;
    }

    public void setAllocationUserId(Integer allocationUserId) {
        this.allocationUserId = allocationUserId;
    }
//    public Integer getAllocatedNumber() {
//        return allocatedNumber;
//    }
//
//    public void setAllocatedNumber(Integer allocatedNumber) {
//        this.allocatedNumber = allocatedNumber;
//    }

    public boolean isAllocateHost() {
        return this.getHostAllocation() != null
                && this.getHostAllocation().getSingUpInfo() != null
                && this.getHostAllocation().getSingUpInfo().getUser() != null
                && this.getHostAllocation().getSingUpInfo().getUser().getEmail() != null;
    }

//    public boolean isAllocateJudge1() {
//        return this.getJudgeAllocation1() != null
//                && this.getJudgeAllocation1().getSingUpInfo() != null
//                && this.getJudgeAllocation1().getSingUpInfo().getUser() != null
//                && this.getJudgeAllocation1().getSingUpInfo().getUser().getEmail() != null;
//    }

//    public boolean isAllocateJudge2() {
//        return this.getJudgeAllocation2() != null
//                && this.getJudgeAllocation2().getSingUpInfo() != null
//                && this.getJudgeAllocation2().getSingUpInfo().getUser() != null
//                && this.getJudgeAllocation2().getSingUpInfo().getUser().getEmail() != null;
//    }

//    public boolean isAllocateAtLeastOneSinger() {
//        return this.getSingerAllocations() != null
//                && this.getSingerAllocations().size() > 0
//                && this.getSingerAllocations().get(0).getSingUpInfo() != null
//                && this.getSingerAllocations().get(0).getSingUpInfo().getUser() != null
//                && this.getJudgeAllocation1().getSingUpInfo().getUser().getEmail() != null;
//    }

    public boolean isFull() {
        if (this.getSingerAllocations() == null || this.getSingerAllocations().size() <= 9) return false;
        for (SingerAllocation sa : this.getSingerAllocations()) {
            if (sa.getSingUpInfo() == null || sa.getSingUpInfo().getUser() == null || sa.getSingUpInfo().getUser().getEmail() == null)
                return false;
        }
        return true;
    }

    public String getRemainTime() {
        long l = date.getTime() - new Date().getTime();
        if (l <= 0) return "已到";
        long day = l / (24 * 60 * 60 * 1000);
        long hour = (l / (60 * 60 * 1000) - day * 24);
        long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
        return "" + day + "天" + hour + "小时" + min + "分";
    }

    public SingerAllocation getFirstAvailable() {
        for (SingerAllocation sa : this.getSingerAllocations()) {
            if (!sa.isAllocated()) return sa;
        }
        return null;
    }

    public String getDisplayName() {
        SimpleDateFormat dteFormat = new SimpleDateFormat("yyyy-MM-dd ");
        return "第" + this.getName() + "场" + ": " + dteFormat.format(getDate()) + " " + getStartTime() + "-" + getEndTime();
    }

    public Integer getAllocationType() {
        if (this.getAllocationUserId() == null) return null;
        for (Allocation allocation : allAllocations) {
            if (this.getAllocationUserId().equals(allocation.getUserId())) {
                return allocation.getAllocationType();
            }
        }
        return null;
    }

    public Allocation getUserAllocation() {
        if (this.getAllocationUserId() == null) return null;
        for (Allocation allocation : allAllocations) {
            if (this.getAllocationUserId().equals(allocation.getUserId())) {
                return allocation;
            }
        }
        return null;
    }

}
