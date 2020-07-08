package pl.forte.technikaldata.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import pl.forte.technikaldata.validation.AddValidators;
import pl.forte.technikaldata.validation.UniqueUsername;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@UniqueUsername(groups = {AddValidators.class})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 60)
    private String username;
    private String password;
    private int enabled;

    private String role;
    @Transient//Pamiętajcie też, że w encji można umieścić pole którego nie ma w bazie danych a jest nam potrzebne na formularzu.

    private String confirmPassword;

}
