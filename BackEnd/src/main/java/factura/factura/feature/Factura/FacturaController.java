package factura.factura.feature.Factura;

import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/factura")
@CrossOrigin({"*"})
public class FacturaController {
    @Autowired
    FacturaService facturaService;

    //CRUD

    //Create
    @PostMapping("/save")
    public Factura save(@RequestBody Factura factura){
        return facturaService.save(factura);
    }

    //Read
    @GetMapping("/{id}")
    public Factura findById(@PathVariable long id){
        return facturaService.findById(id);
    }

    //Update
    @PutMapping("/update")
    public Factura update(@RequestBody Factura factura)
    {
        return facturaService.save(factura);
    }

    //Delete
    @DeleteMapping("/deleteById/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long id){
        facturaService.deleteById(id);
    }

    @GetMapping("/findAll")
    public List<Factura> findAll(){
        return facturaService.findAll();
    }
    
}
