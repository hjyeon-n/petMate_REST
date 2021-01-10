package com.ssd.petMate.Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssd.petMate.parser.ShopParser;

@Controller
public class ApiController {
	
	@Value("#{file['clientId']}")
	String clientId;
	@Value("#{file['clientSecret']}")
	String clientSecret;
	
//	제목 자동완성 -> json parsing
	@RequestMapping(value = "/shopAPI", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<ShopParser> shopAPI(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false) String keyword, RedirectAttributes rttr) {
                StringBuffer response = new StringBuffer();
        List<ShopParser> shopList = new ArrayList<>();
        try {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/shop.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
       
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            String inputLine;
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            JSONParser jsonParser = new JSONParser();
            JSONObject jObject = (JSONObject)jsonParser.parse(response.toString());
            JSONArray arr = (JSONArray)jObject.get("items");
            
//            JSON을 파싱해서 필요한 데이터만 가져오기
            for (int i = 0; i < arr.size(); i++) {
            	JSONObject item = (JSONObject)arr.get(i);
            	
            	String title = (String)item.get("title");
            	String image = (String)item.get("image");
            	String lprice = (String)item.get("lprice");
           
            	ShopParser shopParser = new ShopParser(title, image, lprice);
            	shopList.add(shopParser);
            }           
        } catch (Exception e) {
            System.out.println(e);
        }
        return shopList;
    }
}
