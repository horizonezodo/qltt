package com.shoba.shobaqltt.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class newDetailRequest {
    private String title;
    private Long cateId;
    private String content;
    private boolean status;
    private String createAt;
}
