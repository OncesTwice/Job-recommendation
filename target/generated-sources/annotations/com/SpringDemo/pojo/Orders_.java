package com.SpringDemo.pojo;

import com.SpringDemo.pojo.Buses;
import com.SpringDemo.pojo.Trips;
import com.SpringDemo.pojo.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-09T23:40:37")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Date> createdAt;
    public static volatile SingularAttribute<Orders, Buses> buses;
    public static volatile SingularAttribute<Orders, Long> price;
    public static volatile SingularAttribute<Orders, Trips> tripId;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Users> userId;
    public static volatile SingularAttribute<Orders, Integer> ticketId;
    public static volatile SingularAttribute<Orders, Date> updatedAt;

}