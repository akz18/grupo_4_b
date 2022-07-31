package factura.factura.feature.Factura;


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
