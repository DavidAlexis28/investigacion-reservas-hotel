package com.lumina.luminahotels

import android.content.Context
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class LoginActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val etCorreo = findViewById<EditText>(R.id.etCorreo)
        val etPassword = findViewById<EditText>(R.id.etPassword)
        val btnLogin = findViewById<Button>(R.id.btnLogin)

        btnLogin.setOnClickListener {
            val correo = etCorreo.text.toString().trim()
            val password = etPassword.text.toString().trim()

            if (correo.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, "Por favor completa todos los campos", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            if (correo == "cliente@lumina.com" && password == "123456") {
                val prefs = getSharedPreferences("LuminaPrefs", Context.MODE_PRIVATE)
                with(prefs.edit()) {
                    putString("USER_EMAIL", correo)
                    putBoolean("IS_LOGGED_IN", true)
                    apply()
                }

                Toast.makeText(this, "¡Bienvenido a Lumina Hotels!", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "Correo o contraseña incorrectos", Toast.LENGTH_SHORT).show()
            }
        }
    }
}