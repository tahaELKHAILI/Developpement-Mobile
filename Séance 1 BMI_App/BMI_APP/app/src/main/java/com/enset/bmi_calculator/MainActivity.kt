package com.enset.bmi_calculator

import android.graphics.Color
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import kotlin.math.pow


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //Reading the inputs
        val poids_field : EditText = findViewById(R.id.poidsField)
        val taille_field : EditText = findViewById(R.id.tailleField)
        val submit_button : Button = findViewById(R.id.buttonSubmit)
        val result_text_field : TextView = findViewById(R.id.viewResultText)
        val result_image_field : ImageView = findViewById(R.id.viewResultImg)

        //Logic
        submit_button.setOnClickListener { view ->

            if(poids_field.text.isEmpty() || taille_field.text.isEmpty()){
                result_text_field.text = getString(R.string.invalid_input)
                result_text_field.setTextColor(Color.RED)
                result_image_field.setImageBitmap(null)
            }
            else{
                result_text_field.setTextColor(Color.BLACK)
                val poids = poids_field.text.toString().toDouble()
                val taille = taille_field.text.toString().toDouble()
                //bmi poids en kg + taille en m
                val bmi = poids/(taille/100).pow(2)

                if(bmi < 18.5){
                    result_text_field.text = getString(R.string.resultats_text, bmi)
                    result_image_field.setImageResource(R.drawable.maigre)
                }
                else if(bmi <25){
                    result_text_field.text = getString(R.string.resultats_text, bmi)
                    result_image_field.setImageResource(R.drawable.normal)
                }
                else if(bmi <30){
                    result_text_field.text = getString(R.string.resultats_text, bmi)
                    result_image_field.setImageResource(R.drawable.obese)
                }
                else if(bmi <40){
                    result_text_field.text = getString(R.string.resultats_text, bmi)
                    result_image_field.setImageResource(R.drawable.t_obese)
                }
                else {
                    result_text_field.text = getString(R.string.resultats_text, bmi)
                    result_image_field.setImageResource(R.drawable.surpoids)
                }

                poids_field.setText("")
                taille_field.setText("")

            }

        }
    }
}