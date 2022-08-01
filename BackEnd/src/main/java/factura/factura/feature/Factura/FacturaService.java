package factura.factura.feature.Factura;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacturaService {
    @Autowired
    FacturaRepository facturaRepository;

    //CRUD = Create, Read, Update, Delete

    public Factura save(Factura factura){

        return facturaRepository.save(factura);
    }

    public Factura findById(long id){
        return facturaRepository.findById(id).orElse(new Factura());
    }

    public Factura update(Factura factura){
        return facturaRepository.save(factura);
    }

    public void deleteById(long id){
        facturaRepository.deleteById(id);
    }
    
    public List<Factura> findAll(){
        return facturaRepository.findAll();
    }
}
