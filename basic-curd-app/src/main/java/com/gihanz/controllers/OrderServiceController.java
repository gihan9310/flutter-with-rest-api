package com.gihanz.controllers;

import com.gihanz.documents.Order;
import com.gihanz.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/orders")
public class OrderServiceController {

    @Autowired
    private OrderService orderService;

    @PostMapping(value = "/save")
    public Order save(@RequestBody Order o){
        return   orderService.saveOrder(o);
    }

    @GetMapping(value = "/countAll")
    public Integer countAll(){
        return   orderService.countAllOrders();
    }
}
