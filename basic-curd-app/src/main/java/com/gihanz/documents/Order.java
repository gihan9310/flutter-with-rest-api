package com.gihanz.documents;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Document
public class Order {

    @Id
    private String id;
    @Indexed(unique = true)
    private String orderNo;
    private LocalDate orderDate;
    private String customerId;
    private String mobile;
    private Float totalDiscountPer;
    private Double totalDiscount;
    private List<OrderDetail>details;

}
