package co.reldyn.baas.rd.baas.jenkins.deployment.sample.controller;

import java.time.LocalDateTime;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {

    @GetMapping("/about")
    public ResponseEntity<String> about() {
        return ResponseEntity.ok().body(LocalDateTime.now().toString());
    }
}
