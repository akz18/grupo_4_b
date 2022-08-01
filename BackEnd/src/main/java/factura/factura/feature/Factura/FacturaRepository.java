package factura.factura.feature.Factura;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface FacturaRepository extends CrudRepository<Factura, Long> {
    List<Factura> findAll();
}
