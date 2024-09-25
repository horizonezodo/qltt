package com.shoba.shobaqltt.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class newDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long newDetailId;
    private String title;
    private Long cateId;
    private String content;
    private boolean status;
    private String createAt;
}
