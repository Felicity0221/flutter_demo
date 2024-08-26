package com.Chun_Fung_Technology_Co.intelligent_customer_service;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;
import android.location.Location;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.dev/location";
    private FusedLocationProviderClient fusedLocationClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getLocation")) {
                                fusedLocationClient.getLastLocation()
                                        .addOnSuccessListener(this, new OnSuccessListener<Location>() {
                                            @Override
                                            public void onSuccess(Location location) {
                                                if (location != null) {
                                                    result.success("Latitude: " + location.getLatitude() + ", Longitude: " + location.getLongitude());
                                                } else {
                                                    result.error("UNAVAILABLE", "Location not available.", null);
                                                }
                                            }
                                        });
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }
}