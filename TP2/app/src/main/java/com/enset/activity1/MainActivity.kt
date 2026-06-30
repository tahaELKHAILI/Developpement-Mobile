package com.enset.activity1

import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout

class MainActivity : AppCompatActivity() {

    private var startX = 0f

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val activity1 = findViewById<ConstraintLayout>(R.id.activity1)
        val click = findViewById<Button>(R.id.click)
        val longText = findViewById<TextView>(R.id.longText)

        click.setOnClickListener {
            Toast.makeText(this, "Button click", Toast.LENGTH_SHORT).show()
            longText.text = "Simple Click On Button"
        }

        click.setOnLongClickListener {
            Toast.makeText(this, "Button Long click", Toast.LENGTH_SHORT).show()
            longText.text = "Long Click On Button"
            true
        }
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                startX = event.x
            }

            MotionEvent.ACTION_UP -> {
                val deltaX = event.x - startX

                if (deltaX < -100) {
                    startActivity(Intent(this, MainActivity2::class.java))
                }
            }
        }

        return super.onTouchEvent(event)
    }
}