package com.gihanz.documents;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Document
public class Item {

    @Id
    private String id;
    @Indexed(unique = true)
    private String itemCode;
    private String itemName;
    private  double itemPrice;
    private Double aviableQty;


}
