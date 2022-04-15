/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author baoma
 */
@Entity
@Table(name = "job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j"),
    @NamedQuery(name = "Job.findById", query = "SELECT j FROM Job j WHERE j.id = :id"),
    @NamedQuery(name = "Job.findByUserId", query = "SELECT j FROM Job j WHERE j.userId = :userId"),
    @NamedQuery(name = "Job.findByMajor", query = "SELECT j FROM Job j WHERE j.major = :major"),
    @NamedQuery(name = "Job.findByCompany", query = "SELECT j FROM Job j WHERE j.company = :company"),
    @NamedQuery(name = "Job.findByAddress", query = "SELECT j FROM Job j WHERE j.address = :address"),
    @NamedQuery(name = "Job.findByPosition", query = "SELECT j FROM Job j WHERE j.position LIKE :position"),
    @NamedQuery(name = "Job.findByExperience", query = "SELECT j FROM Job j WHERE j.experience = :experience"),
    @NamedQuery(name = "Job.findBySalary", query = "SELECT j FROM Job j WHERE j.salary = :salary"),
    @NamedQuery(name = "Job.findByNoRecruitments", query = "SELECT j FROM Job j WHERE j.noRecruitments = :noRecruitments"),
    @NamedQuery(name = "Job.findByRequirement", query = "SELECT j FROM Job j WHERE j.requirement = :requirement"),
    @NamedQuery(name = "Job.findByDescription", query = "SELECT j FROM Job j WHERE j.description = :description"),
    @NamedQuery(name = "Job.findByCreatedAt", query = "SELECT j FROM Job j WHERE j.createdAt = :createdAt"),
    @NamedQuery(name = "Job.findByUpdatedAt", query = "SELECT j FROM Job j WHERE j.updatedAt = :updatedAt")})
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "user_id")
    private Integer userId;
    @Size(max = 255)
    @Column(name = "major")
    private String major;
    @Size(max = 255)
    @Column(name = "company")
    private String company;
    @Size(max = 255)
    @Column(name = "address")
    private String address;
    @Size(max = 255)
    @Column(name = "position")
    private String position;
    @Size(max = 255)
    @Column(name = "experience")
    private String experience;
    @Size(max = 255)
    @Column(name = "salary")
    private String salary;
    @Column(name = "no_recruitments")
    private Integer noRecruitments;
    @Size(max = 500)
    @Column(name = "requirement")
    private String requirement;
    @Size(max = 500)
    @Column(name = "description")
    private String description;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    public Job() {
    }

    public Job(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public Integer getNoRecruitments() {
        return noRecruitments;
    }

    public void setNoRecruitments(Integer noRecruitments) {
        this.noRecruitments = noRecruitments;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.SpringDemo.pojo.Job[ id=" + id + " ]";
    }
    
}
