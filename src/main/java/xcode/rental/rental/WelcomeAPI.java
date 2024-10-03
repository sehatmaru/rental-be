package xcode.rental.rental;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Validated
@RestController
@RequestMapping(value = "welcome")
public class WelcomeAPI {


    @GetMapping("")
    void welcome() {
        System.out.println("Hello World");
    }
}
