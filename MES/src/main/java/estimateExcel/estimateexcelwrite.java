package estimateExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class estimateexcelwrite {
	public XSSFWorkbook writeExcel(String realpath, String ordername, String partname) {
		File file = null;
		FileOutputStream fos= null;
		XSSFWorkbook workbook = null;
		
		
		try {
			String filepath = realpath + "\\작업공정표.xlsx";
			
			FileInputStream fileinput = new FileInputStream(filepath);
			workbook = new XSSFWorkbook(fileinput);
			XSSFRow xssfRow = null;
			XSSFCell xssfCell = null;
			
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			xssfRow = sheet.getRow(5);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue(ordername);
			
			xssfRow = sheet.getRow(5);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue(partname);
			
			xssfRow = sheet.getRow(6);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue("aa");
			
			xssfRow = sheet.getRow(6);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue("aa");
			
			xssfRow = sheet.getRow(7);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue("aa");
			
			xssfRow = sheet.getRow(7);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue("aa");
			
			//공정
			int rowNo = 10;
			


			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return workbook;
	}
}
