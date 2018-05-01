package com.pallen.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pallen.model.Hello;

public interface HelloDao extends JpaRepository<Hello, Integer> {

}