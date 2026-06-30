package com.example.login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.splashscreen.SplashScreen;

public class SecondActivity  extends AppCompatActivity {

        TextView username, password;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            SplashScreen.installSplashScreen(this);

            super.onCreate(savedInstanceState);
            setContentView(R.layout.second_activity);

            username = findViewById(R.id.usernameTextView);
            password = findViewById(R.id.passwordTextView);
            Bundle bundle = getIntent().getExtras();

            username.setText(bundle.getString("username"));
            password.setText(bundle.getString("password"));
        }

        public void retour(View view) {
            Intent intent = new Intent(this, FirstActivity.class);
            startActivity(intent);
        }
    @Override
    protected void onRestart() {
        super.onRestart();
        Toast.makeText(getBaseContext(), "onReStart",
                Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onStart() {
        super.onStart();Toast.makeText(getBaseContext(),
                "onStart",
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

