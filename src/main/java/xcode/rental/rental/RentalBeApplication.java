package xcode.rental.rental;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
@EnableEncryptableProperties
public class RentalBeApplication {

    public static void main(String[] args) {
        SpringApplication.run(RentalBeApplication.class, args);
    }

}
