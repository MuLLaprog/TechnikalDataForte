package pl.forte.technikaldata.user;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@AllArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public User findByUserName(String username) {
        return userRepository.findByUsername(username);//zwracamy uzytkownika
    }

    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));//ustawiamy hasło ale wczesniej je enkodujemy
        user.setEnabled(1);//utawiamy aktywność uzytkownika
        user.setRole("ROLE_ADMIN");//ustawiamy role
        userRepository.save(user);//zapisujemy użytkownika
    }

}
