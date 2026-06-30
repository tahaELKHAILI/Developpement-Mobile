package com.enset.activity1

import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import kotlin.compareTo


class MainActivity4: AppCompatActivity() {
    private var startX = 0f

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main4)

        val textViewSpinner: TextView = findViewById(R.id.textViewSpinner)
        val spinner: Spinner = findViewById(R.id.spinnerlist)
        val itemList = listOf("Item 1", "Item 2", "Item 3", "Item 4")
        val adapter = ArrayAdapter(
            this,
            android.R.layout.simple_spinner_item, // Layout for the selected visible item
            itemList
        )
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = adapter


        }
    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.action) {
            MotionEvent.ACTION_DOWN -> {
                startX = event.x
            }

            MotionEvent.ACTION_UP -> {
                val deltaX = event.x - startX

                if (deltaX < -100) {
                    startActivity(Intent(this, MainActivity::class.java))
                }
                else if (deltaX > 100){
                    startActivity(Intent(this, MainActivity3::class.java))

                }
            }
        }

        return super.onTouchEvent(event)
    }
    }
