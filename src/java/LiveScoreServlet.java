import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.io.entity.EntityUtils;

import org.json.*;

@WebServlet("/LiveScoreServlet")
public class LiveScoreServlet extends HttpServlet {

@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
          throws ServletException, IOException 
{
        
    resp.setIntHeader("Refresh", 10);
    resp.setContentType("text/html;charset=UTF-8");
    PrintWriter out = resp.getWriter();

    String apiUrl = "https://api.cricapi.com/v1/currentMatches?apikey=e12ced0b-a2d2-45d2-8368-701c447213bc&offset=0";

       out.println("""
       <style>
       body{
           font-family: Arial, sans-serif;
           background-image: url('image/Background.jpg');
           background-size: cover;
           background-position: center;
           background-attachment: fixed;
           padding:20px;
           margin:0;
       }
       
       body:before{
           content:"";
           position:fixed;
           top:0; left:0;
           width:100%; height:100%;
           background: linear-gradient(120deg,rgba(0, 32, 63, 0.75),rgba(0, 128, 0, 0.7)); 
           z-index:-1;
           backdrop-filter: blur(1px);
           }
       
       /* Header Style */
       .header{
           display:flex;
           justify-content: space-between;
           align-items:center;
              }
       
         h1{
           color:white;
           text-shadow: 2px 2px 5px black;
           }
       
       .btn{
           text-decoration:none;
           padding:8px 15px;
           border-radius:5px;
           font-weight:bold;
           }
       
       .home-btn{
           color:#00ffcc;
           }
       
       .home-btn:hover{
           background:#00ffcc;
           color:black;
        }
       
       .match-box{
           background: rgba(255,255,255,0.9);
           padding:15px;
           margin:12px 0;
           border-radius:12px;
           box-shadow:0 0 15px #222;
           animation: slideUp 0.6s ease-out;
       }
       </style>
        """);
       
        out.println("""
        <div class='header'>
            <h1>🏏 Live Cricket Scores</h1>
            <div>
                <a href='index.html' class='btn home-btn'>Logout</a>
            </div>
        </div>
        <hr>
        """);

try (CloseableHttpClient client = HttpClients.createDefault())
        {
        HttpGet request = new HttpGet(apiUrl);
        String response = client.execute(request,
        httpResponse -> EntityUtils.toString(httpResponse.getEntity())
        );

    JSONObject json = new JSONObject(response);

    if (json.has("data")) { JSONArray data = json.getJSONArray("data");

    for (int i = 0; i < data.length(); i++) {
        JSONObject match = data.getJSONObject(i);

        String name = match.optString("name", "Unknown Match");
        String status = match.optString("status", "Status unavailable");

        out.println("<div class='match-box'>");
        out.println("<h3>" + name + "</h3>");
        out.println("<p><b>Status:</b> " + status + "</p>");

  if (match.has("score")) {
        JSONArray scores = match.getJSONArray("score");

  for (int j = 0; j < scores.length(); j++) {
        
        JSONObject s = scores.getJSONObject(j);

        String inning = s.optString("inning");
        String r = s.optString("r");
        String w = s.optString("w");
        String o = s.optString("o");

        out.println("<p><b>" + inning + ":</b> " + r + "/" + w + " in " + o + " overs</p>");
                        }
                    }

                    out.println("</div>");
                    out.println("<hr>");
                }
            } 
    else {
    
    out.println("<p style='color:white;'>No live matches available.</p>");
            
    }
        } 
catch (Exception e) 
{
     e.printStackTrace();
            
     out.println("<p style='color:red;'>Error fetching score: "+ e.getMessage() + "</p>");
        }

        out.close();
    }
}
