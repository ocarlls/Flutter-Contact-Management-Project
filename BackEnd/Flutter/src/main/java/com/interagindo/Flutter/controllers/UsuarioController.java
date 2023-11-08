package com.interagindo.Flutter.controllers;

import com.interagindo.Flutter.models.Usuario;
import com.interagindo.Flutter.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usuario")
@CrossOrigin
public class UsuarioController {
    @Autowired
    UsuarioService service;
    @PostMapping("/cadastrar")
    private ResponseEntity cadastrarUsuario(@RequestBody Usuario usuario){
        return service.save(usuario);
    }
}
