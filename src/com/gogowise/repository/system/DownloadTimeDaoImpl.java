package com.gogowise.repository.system;

import com.gogowise.repository.ModelDaoImpl;
import com.gogowise.domain.system.DownloadTime;
import org.springframework.stereotype.Repository;

@Repository("downloadTimeDao")
public class DownloadTimeDaoImpl extends ModelDaoImpl<DownloadTime> implements DownloadTimeDao{
    public DownloadTime findRecord() {
        DownloadTime dt = this.findFist("From DownloadTime dt");
        if(dt == null){
            dt = new DownloadTime();
            dt.setDownloadTimes(1000);
        }
        return dt;
    }
}
