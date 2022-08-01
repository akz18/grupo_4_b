package factura.factura.feature.Factura;
import java.sql.Timestamp;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;

@Data
@Table("facturas")
public class Factura {

    @Id
    @Column("id")
    private long Id;

    private Timestamp fecha;
    private String cliente;
    private String producto;
    private double precio;
    private int cantidad;
    private boolean archivado;
    private String firma;
    private double total;
}
