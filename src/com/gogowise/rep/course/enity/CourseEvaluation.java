package com.gogowise.rep.course.enity;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-11-20
 * Time: 下午1:01
 * To change this template use File | Settings | File Templates.
 */

@Entity
public class CourseEvaluation extends AbstractPersistence {
    @OneToOne
    private Course course;
    @OneToOne
    private BaseUser evaluator;
    private Double interest;//       趣味性
    private Double available;//      实用性
    private Double interaction;//    互动性
    private Double costPerformance;//  性价比
    private Double  synthetical;


    //===============getter and setter===========


    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public BaseUser getEvaluator() {
        return evaluator;
    }

    public void setEvaluator(BaseUser evaluator) {
        this.evaluator = evaluator;
    }

    public Double getInterest() {
        return interest;
    }

    public void setInterest(Double interest) {
        this.interest = interest;
    }

    public Double getAvailable() {
        return available;
    }

    public void setAvailable(Double available) {
        this.available = available;
    }

    public Double getInteraction() {
        return interaction;
    }

    public void setInteraction(Double interaction) {
        this.interaction = interaction;
    }

    public Double getCostPerformance() {
        return costPerformance;
    }

    public void setCostPerformance(Double costPerformance) {
        this.costPerformance = costPerformance;
    }

    public Double getSynthetical() {
        return synthetical;
    }

    public void setSynthetical() {
        this.synthetical = Math.round((this.available+this.interest+this.interaction+this.costPerformance)*10/4)/10.0;
    }
}
