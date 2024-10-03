package xcode.carent

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CarentApplication

fun main(args: Array<String>) {
	runApplication<CarentApplication>(*args)
}
