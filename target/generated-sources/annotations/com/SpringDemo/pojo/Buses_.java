package com.SpringDemo.pojo;

import com.SpringDemo.pojo.Orders;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-09T23:40:37")
@StaticMetamodel(Buses.class)
public class Buses_ { 

    public static volatile SingularAttribute<Buses, Date> createdAt;
    public static volatile SingularAttribute<Buses, String> name;
    public static volatile SingularAttribute<Buses, String> location;
    public static volatile SingularAttribute<Buses, Integer> id;
    public static volatile SingularAttribute<Buses, Date> time;
    public static volatile ListAttribute<Buses, Orders> ordersList;
    public static volatile SingularAttribute<Buses, Date> updatedAt;

}