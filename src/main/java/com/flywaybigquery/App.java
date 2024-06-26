package com.flywaybigquery;
import com.simba.googlebigquery.jdbc42.DataSource;
import org.flywaydb.core.Flyway;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import org.flywaydb.core.api.Location;

public class App {
    public static void main(String[] args) {
        try {
            String flywayLocation = null;
            if (args.length > 0) {
                flywayLocation = args[0];
            }

            if (flywayLocation == null) {
                flywayLocation = "/home/wissemk/IdeaProjects/FlywaySchemaBigquery/flyway/db/migration/";
            }
            System.out.println("flywayLocation:::"+flywayLocation+"\n");

            DataSource dataSource = new DataSource();
            dataSource.setURL("jdbc:bigquery://https://www.googleapis.com/bigquery/v2:443;ProjectId=data-product-analytic-ecommrce;OAuthType=3");

            Flyway flyway = Flyway.configure()
                    .createSchemas(false)
                    .defaultSchema("data-product-analytic-ecommrce.flyway")
                    .schemas("data-product-analytic-ecommrce.flyway")
                    .dataSource(dataSource)
                    .baselineOnMigrate(true)
                    .locations("filesystem:"+flywayLocation)
                    .load();

            flyway.migrate();
        }  catch (Exception e) {
            System.err.println("Error running database migration: " + e.getMessage());
            e.printStackTrace();
        }
    }

}
