package com.enset.activity1

import android.app.DatePickerDialog
import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.util.Calendar

class MainActivity5 : AppCompatActivity() {
    private var startX = 0f

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main5)

        val buttonPickDate: Button = findViewById(R.id.buttonPickDate)
        val textViewDate: TextView = findViewById(R.id.textViewDate)

        buttonPickDate.setOnClickListener {
            // Get today's date values to set as the starting point inside the dialog
            val calendar = Calendar.getInstance()
            val currentYear = calendar.get(Calendar.YEAR)
            val currentMonth = calendar.get(Calendar.MONTH)
            val currentDay = calendar.get(Calendar.DAY_OF_MONTH)

            // Open the DatePickerDialog
            val datePickerDialog = DatePickerDialog(
                this,
                { _, selectedYear, selectedMonth, selectedDay ->
                    // --- THIS IS THE ONDATESET CALLBACK ---
                    val actualMonth = selectedMonth + 1 // Add 1 because January is 0
                    val formattedDate = "$selectedDay/$actualMonth/$selectedYear"

                    // Show the formatted date to the user
                    textViewDate.text = "Chosen Date: $formattedDate"
                },
                currentYear,
                currentMonth,
                currentDay
            )

            // Show the pop-up calendar window
            datePickerDialog.show()
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
                    startActivity(Intent(this, MainActivity::class.java))
                }
                else if (deltaX > 100){
                    startActivity(Intent(this, MainActivity4::class.java))
                }
            }
        }

        return super.onTouchEvent(event)
    }
}
