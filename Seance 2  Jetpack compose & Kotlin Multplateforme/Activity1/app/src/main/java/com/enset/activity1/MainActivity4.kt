package com.enset.activity1

import android.content.Intent
import android.os.Bundle
import android.view.ContextMenu
import android.view.MenuItem
import android.view.MotionEvent
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity4: AppCompatActivity() {
    private var startX = 0f
    // Declare textViewSpinner at class level so all methods can access it easily
    private lateinit var textViewSpinner: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main4)

        textViewSpinner = findViewById(R.id.textViewSpinner)
        val spinner: Spinner = findViewById(R.id.spinnerlist)
        val itemList = listOf("Car", "Motorcycle", "Train", "Plane")

        val adapter = ArrayAdapter(
            this,
            android.R.layout.simple_spinner_item,
            itemList
        )
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = adapter

        // 1. Register the TextView so it triggers the menu on long-press
        registerForContextMenu(textViewSpinner)

        // Handle the item selection here
        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                // Get the selected text from the list
                val selectedItem = itemList[position]

                // Write the text into your TextView
                textViewSpinner.text = "Selected Vehicle: $selectedItem"
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                // Left empty as it's not needed for a static list
            }
        }
    }

    // 2. This creates the visual menu pop-up when long-pressed
    override fun onCreateContextMenu(
        menu: ContextMenu?,
        v: View?,
        menuInfo: ContextMenu.ContextMenuInfo?
    ) {
        super.onCreateContextMenu(menu, v, menuInfo)

        // Build the menu options
        menu?.setHeaderTitle("Vehicle Options")
        menu?.add(0, 1, 0, "Copy selected vehicle")
        menu?.add(0, 2, 1, "Clear text view")
    }

    // 3. This handles the click events for the context menu items
    override fun onContextItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            1 -> {
                Toast.makeText(this, "Copied to clipboard!", Toast.LENGTH_SHORT).show()
                true
            }
            2 -> {
                textViewSpinner.text = "No vehicle selected"
                true
            }
            else -> super.onContextItemSelected(item)
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
                    startActivity(Intent(this, MainActivity5::class.java))
                }
                else if (deltaX > 100){
                    startActivity(Intent(this, MainActivity3::class.java))
                }
            }
        }

        return super.onTouchEvent(event)
    }
}
