package com.shoba.shobaqltt.repo;

import com.shoba.shobaqltt.model.category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CateRepo extends JpaRepository<category, Long> {
    Optional<category> findByCateId(Long cateId);

    List<category> findAllByCateActivate(boolean cateActivate);
}
