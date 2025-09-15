package com.example.actividad2

import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.view.ContextThemeWrapper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CANAL = "canal_ui_nativa"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CANAL).setMethodCallHandler { chamada, resultado ->
            when (chamada.method) {
                "mostrarToast" -> {
                    mostrarToast()
                    resultado.success(null)
                }
                "mostrarDialogo" -> {
                    mostrarDialogo()
                    resultado.success(null)
                }
                else -> resultado.notImplemented()
            }
        }
    }

    private fun mostrarToast() {
        runOnUiThread {
            Toast.makeText(
                this,
                "Toast nativo funcionando!",
                Toast.LENGTH_SHORT
            ).show()
        }
    }

    private fun mostrarDialogo() {
        runOnUiThread {
            val contexto = ContextThemeWrapper(this, androidx.appcompat.R.style.Theme_AppCompat_Light_Dialog)
            
            AlertDialog.Builder(contexto)
                .setTitle("Diálogo Nativo")
                .setMessage("MethodChannel funcionando corretamente!")
                .setPositiveButton("OK") { dialogo, _ -> 
                    dialogo.dismiss() 
                }
                .create()
                .show()
        }
    }
}