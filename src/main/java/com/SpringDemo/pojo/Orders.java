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
 * @author Kien Mason
 */
@Entity
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findById", query = "SELECT o FROM Orders o WHERE o.id = :id"),
    @NamedQuery(name = "Orders.findByNameThisTime", query = "SELECT o FROM Orders o WHERE o.nameThisTime = :nameThisTime"),
    @NamedQuery(name = "Orders.findByPriceThisTime", query = "SELECT o FROM Orders o WHERE o.priceThisTime = :priceThisTime"),
    @NamedQuery(name = "Orders.findByCreatedAt", query = "SELECT o FROM Orders o WHERE o.createdAt = :createdAt"),
    @NamedQuery(name = "Orders.findByUpdatedAt", query = "SELECT o FROM Orders o WHERE o.updatedAt = :updatedAt"),
    @NamedQuery(name = "Orders.findByTripId", query = "SELECT o FROM Orders o WHERE o.tripId = :tripId"),
    @NamedQuery(name = "Orders.findByUserId", query = "SELECT o FROM Orders o WHERE o.userId = :userId"),
    @NamedQuery(name = "Orders.findByBusId", query = "SELECT o FROM Orders o WHERE o.busId = :busId")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 255)
    @Column(name = "name_this_time")
    private String nameThisTime;
    @Column(name = "price_this_time")
    private Long priceThisTime;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @Column(name = "trip_id")
    private Integer tripId;
    @Column(name = "user_id")
    private Integer userId;
    @Column(name = "bus_id")
    private Integer busId;

    public Orders() {
    }

    public Orders(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameThisTime() {
        return nameThisTime;
    }

    public void setNameThisTime(String nameThisTime) {
        this.nameThisTime = nameThisTime;
    }

    public Long getPriceThisTime() {
        return priceThisTime;
    }

    public void setPriceThisTime(Long priceThisTime) {
        this.priceThisTime = priceThisTime;
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

    public Integer getTripId() {
        return tripId;
    }

    public void setTripId(Integer tripId) {
        this.tripId = tripId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBusId() {
        return busId;
    }

    public void setBusId(Integer busId) {
        this.busId = busId;
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
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.SpringDemo.pojo.Orders[ id=" + id + " ]";
    }
    
}
