package com.example.login;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.splashscreen.SplashScreen;
public class FirstActivity extends AppCompatActivity{
        EditText username, password;
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.first_activity);
            Toast.makeText(this, "onCreate", Toast.LENGTH_SHORT).show();
            username = findViewById(R.id.usernameTextView);
            password = findViewById(R.id.passwordTextView);
        }

        public void envoyer(View view) {
            Intent intent = new Intent(this, SecondActivity.class);
            String usernameString = username.getText().toString().trim();
            String passwordString = password.getText().toString().trim();
            if (usernameString.isEmpty() || passwordString.isEmpty()) {
                Toast.makeText(this, getResources().getString(R.string.fillin), Toast.LENGTH_LONG).show();
            } else {
                Bundle bundle = new Bundle();
                bundle.putString("username", username.getText().toString().trim());
                bundle.putString("password", password.getText().toString().trim());
                intent.putExtras(bundle);

                startActivity(intent);
                finish();
            }
        }
    @Override
    protected void onStart() {
        super.onStart();
        Toast.makeText(getBaseContext(), "onStart",
                Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Toast.makeText(getBaseContext(), "onReStart",
                Toast.LENGTH_LONG).show();
    }


    @Override
    protected void onStop() {
        super.onStop();
        Toast.makeText(getBaseContext(), "onStop",
                Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onDestroy() {

        super.onDestroy();
        Toast.makeText(getBaseContext(), "onDestroy",
                Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onPause() {
        super.onPause();
        Toast.makeText(getBaseContext(), "onPause",
                Toast.LENGTH_LONG).show();
    }


    }

