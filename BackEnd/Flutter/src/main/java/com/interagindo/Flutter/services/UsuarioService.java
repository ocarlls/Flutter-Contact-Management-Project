package com.interagindo.Flutter.services;

import com.interagindo.Flutter.models.Usuario;
import com.interagindo.Flutter.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
    @Autowired
    UsuarioRepository repository;

    public ResponseEntity save(Usuario usuario){
        repository.save(usuario);
        return ResponseEntity.ok().body("Usuario salvo com sucesso!");
    }

}
