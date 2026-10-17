package com.lumina.backend.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Configuration;

import jakarta.annotation.PostConstruct;
import java.io.InputStream;

@Configuration
public class FirebaseConfig {

    @PostConstruct
    public void initFirebase() {
        try {
            InputStream serviceAccount = getClass().getClassLoader()
                    .getResourceAsStream("serviceAccountKey.json");

            if (serviceAccount != null) {
                FirebaseOptions options = FirebaseOptions.builder()
                        .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                        .build();

                if (FirebaseApp.getApps().isEmpty()) {
                    FirebaseApp.initializeApp(options);
                    System.out.println(">>> Firebase Admin SDK inicializado correctamente.");
                }
            } else {
                System.out.println(">>> [Aviso] serviceAccountKey.json no encontrado en resources. Modo de prueba local.");
            }
        } catch (Exception e) {
            System.err.println(">>> Error al inicializar Firebase Admin SDK: " + e.getMessage());
        }
    }
}
