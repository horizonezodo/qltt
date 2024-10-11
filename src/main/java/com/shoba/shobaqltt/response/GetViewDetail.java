package com.shoba.shobaqltt.response;

import com.shoba.shobaqltt.model.newDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetViewDetail {
    newDetail newDetail;
    String name;
}
