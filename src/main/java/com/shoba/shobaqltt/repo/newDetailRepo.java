package com.shoba.shobaqltt.repo;

import com.shoba.shobaqltt.model.newDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface newDetailRepo extends JpaRepository<newDetail, Long> {
    newDetail findByCateId(Long cateId);

    newDetail findByCateIdAndStatus(Long cateId, boolean status);
    Optional<newDetail> findByNewDetailId(Long newDetaiId);
}
