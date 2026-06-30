package com.enset.activity1

import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity2 : AppCompatActivity() {
    private var startX = 0f
    private var startY = 0f

    // Declare the TextView here without initializing it yet
    private lateinit var textViewSwipe: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)

        // Initialize your TextView safely after the layout is loaded
        textViewSwipe = findViewById(R.id.SwipeText)
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                startX = event.x
                startY = event.y
            }

            MotionEvent.ACTION_UP -> {
                val deltaX = event.x - startX
                val deltaY = event.y - startY

                if (kotlin.math.abs(deltaX) > kotlin.math.abs(deltaY)) {
                    // Horizontal Swipes
                    if (deltaX > 100) {
                        Toast.makeText(this, "Swipe right", Toast.LENGTH_SHORT).show()
                        textViewSwipe.text = "Swiped right!"
                        startActivity(Intent(this, MainActivity::class.java))
                    } else if (deltaX < -100) {
                        Toast.makeText(this, "Swipe left", Toast.LENGTH_SHORT).show()
                        textViewSwipe.text = "Swiped left!"
                        startActivity(Intent(this, MainActivity3::class.java))
                    }
                } else {
                    // Vertical Swipes
                    if (deltaY > 100) {
                        Toast.makeText(this, "Swipe down", Toast.LENGTH_SHORT).show()
                        textViewSwipe.text = "Swiped Down!"
                    } else if (deltaY < -100) {
                        Toast.makeText(this, "Swipe up", Toast.LENGTH_SHORT).show()
                        textViewSwipe.text = "Swiped Up!"
                    }
                }
            }
        }

        return super.onTouchEvent(event)
    }
}
