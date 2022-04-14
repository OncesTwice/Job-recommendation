package com.SpringDemo.pojo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-04-14T22:31:42")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Integer> busId;
    public static volatile SingularAttribute<Orders, Date> createdAt;
    public static volatile SingularAttribute<Orders, Long> priceThisTime;
    public static volatile SingularAttribute<Orders, String> nameThisTime;
    public static volatile SingularAttribute<Orders, Integer> tripId;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Integer> userId;
    public static volatile SingularAttribute<Orders, Date> updatedAt;

}