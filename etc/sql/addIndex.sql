alter table skclass add index index_skclass_classid (classid) ;
alter table skclass add index index_skclass_schoolid (schoolid) ;
alter table classinfo add index index_classinfo_uid (uid) ;


drop table classxiaoqu;
drop table Classinfo;
drop table Xiaoqu;
drop table School;