package com.gogowise.rep;

/**
 * Created by IntelliJ IDEA.
 * User: Benson
 * Date: Feb 22, 2009
 * Time: 4:23:19 PM
 * To change this template use File | Settings | File Templates.
 */


import javax.persistence.*;


@MappedSuperclass
public abstract class AbstractPersistence implements Persistable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @Access(value = AccessType.PROPERTY)
    private Integer id = null;

    @Transient
    private Integer totalSize;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
    }
}
