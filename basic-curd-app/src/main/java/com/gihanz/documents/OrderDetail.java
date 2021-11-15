package com.gihanz.documents;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Document
public class OrderDetail {

    @Id
    private String id;
    private Double price;
    private Long qty;
    private float lineDiscountPer;
    private Double lineDiscount;
    private Double lineValue;
//    Relation code
    private String itemCode;



}
