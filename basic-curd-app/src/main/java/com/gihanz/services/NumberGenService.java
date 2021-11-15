package com.gihanz.services;

import com.gihanz.documents.NumberGeneration;
import com.gihanz.repositories.NumberGenerationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NumberGenService {

    @Autowired
    private NumberGenerationRepository numberGenerationRepository;

    public String getNextCode(String serchKey){
        String key =null;
        try {
            NumberGeneration nextNumber = numberGenerationRepository.findBySearchKey(serchKey);
            key = nextNumber.getPrefix()+nextNumber.getNextNumber();
            nextNumber.setNextNumber(nextNumber.getNextNumber()+1);
            numberGenerationRepository.save(nextNumber);
        }catch (Exception e){
            e.printStackTrace();
        }
        return key;
    }
}
