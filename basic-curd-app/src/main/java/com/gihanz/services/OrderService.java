package com.gihanz.services;

import com.gihanz.documents.Item;
import com.gihanz.documents.NumberGeneration;
import com.gihanz.documents.Order;
import com.gihanz.repositories.ItemRepository;
import com.gihanz.repositories.NumberGenerationRepository;
import com.gihanz.repositories.OrderRepository;
import com.gihanz.utils.NumberGenerationKeys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderService {

    @Autowired
    private NumberGenService numberGenService;
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Transactional
    public Order saveOrder(Order order){

        try {
            System.out.println("Calling............"+order);
            order.setOrderNo( numberGenService.getNextCode(NumberGenerationKeys.ORDER_UNIQUE_KEY));
            order.getDetails().forEach(i->{
                Item item = itemRepository.findByItemCode(i.getItemCode());
                item.setAviableQty(item.getAviableQty()-i.getQty());
                itemRepository.save(item);
                System.out.println("clling");
            });
            return orderRepository.save(order);
        }catch (Exception e){
           e.printStackTrace();
           return null;
        }
    }

    public Integer countAllOrders(){
        try {
            return orderRepository.countAllByIdIsNotNull();
        }catch (Exception e){
            e.getMessage();
          return  null;
        }
    }
}
