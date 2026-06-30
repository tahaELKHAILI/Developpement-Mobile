package com.enset.activity1

import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.widget.doAfterTextChanged

class MainActivity3 : AppCompatActivity() {
    private var startX = 0f
    private lateinit var textViewChange: TextView
    private lateinit var textfield: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main3)

        textViewChange = findViewById(R.id.textViewTextChange)
        textfield = findViewById(R.id.textfield)

        textfield.doAfterTextChanged { text ->
            textViewChange.text = textfield.text
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
                    startActivity(Intent(this, MainActivity4::class.java))
                }
                else if (deltaX > 100){
                    startActivity(Intent(this, MainActivity2::class.java))

                }
            }
        }

        return super.onTouchEvent(event)
    }
}