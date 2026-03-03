import { Injectable } from '@angular/core';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { OrderDTO } from '../services/api.service';

@Injectable({
  providedIn: 'root'
})
export class InvoiceService {

  constructor() {}

  private numberToWords(num: number): string {

  const ones = [
    '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
    'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen',
    'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
  ];

  const tens = [
    '', '', 'Twenty', 'Thirty', 'Forty', 'Fifty',
    'Sixty', 'Seventy', 'Eighty', 'Ninety'
  ];

  const convertBelowThousand = (n: number): string => {
    if (n === 0) return '';
    if (n < 20) return ones[n];
    if (n < 100)
      return tens[Math.floor(n / 10)] + ' ' + ones[n % 10];
    return ones[Math.floor(n / 100)] + ' Hundred ' +
           convertBelowThousand(n % 100);
  };

  if (num === 0) return 'Zero Rupees Only';

  let result = '';

  const crore = Math.floor(num / 10000000);
  num %= 10000000;

  const lakh = Math.floor(num / 100000);
  num %= 100000;

  const thousand = Math.floor(num / 1000);
  num %= 1000;

  const hundred = num;

  if (crore) result += convertBelowThousand(crore) + ' Crore ';
  if (lakh) result += convertBelowThousand(lakh) + ' Lakh ';
  if (thousand) result += convertBelowThousand(thousand) + ' Thousand ';
  if (hundred) result += convertBelowThousand(hundred);

  return result.trim() + ' Rupees Only';
}

 async generateInvoice(order: OrderDTO) {

  const pdf = new jsPDF('p', 'mm', 'a4');

  const pageWidth = pdf.internal.pageSize.getWidth();
  const pageHeight = pdf.internal.pageSize.getHeight();

  /* =========================
     COMPANY HEADER SECTION
  ==========================*/

  // Company Logo (Left Side)
  const logo = 'assets/logo.png'; // change path
  pdf.addImage(logo, 'PNG', 10, 10, 30, 20);

  pdf.setFontSize(18);
  pdf.setFont('helvetica', 'bold');
  pdf.text('Ms CarePrime Private Limited', pageWidth / 2, 15, { align: 'center' });

  pdf.setFontSize(10);
  pdf.setFont('helvetica', 'normal');
  pdf.text('GST No: 09AAUCM2860K1ZR', pageWidth / 2, 22, { align: 'center' });
  pdf.text('Phone: +91 7055110711', pageWidth / 2, 27, { align: 'center' });
  pdf.text('Email: support@mscareprime.in', pageWidth / 2, 32, { align: 'center' });

  pdf.line(10, 38, pageWidth - 10, 38);

  /* =========================
     INVOICE TITLE
  ==========================*/

  pdf.setFontSize(16);
  pdf.setFont('helvetica', 'bold');
  pdf.text('TAX INVOICE', pageWidth / 2, 45, { align: 'center' });

  /* =========================
     ORDER INFO
  ==========================*/
pdf.setFontSize(11);
pdf.setFont('helvetica', 'normal');

const leftX = 14;
const rightX = pageWidth - 85;
let startY = 55;
const date = new Date(order.orderDate);
const formattedDate = date.toLocaleDateString('en-GB'); // dd/mm/yyyy
pdf.text(`Invoice No: ${order.orderCode}`, leftX, startY);
pdf.text(`Date: ${formattedDate}`, leftX, startY + 7);
pdf.text(`Order Status: ${order.orderStatus}`, leftX, startY + 14);
pdf.text(`Payment Status: ${order.paymentStatus?.toLowerCase() === 'success'? 'Paid': order.paymentStatus}`, leftX, startY + 21);


/* =========================
   SHIPPING ADDRESS (RIGHT SIDE)
==========================*/

pdf.setFont('helvetica', 'bold');
pdf.text('Shipping Address:', rightX, startY);

pdf.setFont('helvetica', 'normal');
pdf.text(`Name: ${order?.shippingAddress?.fullName || '-'}`, rightX, startY + 7);
pdf.text(`Mobile: ${order?.shippingAddress?.phone || '-'}`, rightX, startY + 14);

// Auto wrap address properly
const fullAddress =
  `${order?.shippingAddress?.addressLine || ''}, ` +
  `${order?.shippingAddress?.city || ''}, ` +
  `${order?.shippingAddress?.state || ''} - ` +
  `${order?.shippingAddress?.pincode || ''}`;

const splitAddress = pdf.splitTextToSize(fullAddress, 70);
pdf.text(splitAddress, rightX, startY + 21);
  
  /* =========================
     WATERMARK IF PAID
  ==========================*/

  if (order.paymentStatus?.toLowerCase() === 'success') {
    pdf.setFontSize(60);
    pdf.setTextColor(200, 200, 200);
    pdf.text('PAID', pageWidth / 2, pageHeight / 2, {
      align: 'center',
      angle: 45
    });
    pdf.setTextColor(0, 0, 0);
  }

  /* =========================
     ITEMS TABLE
  ==========================*/
const rupee = 'Rs.';

pdf.setFontSize(11);
  const tableData = order.orderDetails.map((item, index) => ([
    index + 1,
    item.productName,
    item.categoryName,
    item.brandName,
    item.quantity,
    `${rupee}${item.unitPrice}`,
    `${rupee}${item.discount}`,
    `${rupee}${item.totalAmount}`
  ]));

  autoTable(pdf, {
    startY: 85,
    head: [[
      '#', 'Product', 'Category',
      'Qty', 'Unit', 'Discount', 'Total'
    ]],
    body: tableData,
    theme: 'grid',
    headStyles: {
      fillColor: [22, 160, 133],
      textColor: 255,
      halign: 'center'
    },
    styles: {
      fontSize: 9
    },
    didDrawPage: (data) => {
      // Auto page break automatically handled
    }
  });

  const finalY = (pdf as any).lastAutoTable.finalY + 10;

  /* =========================
     TOTALS SECTION
  ==========================*/

  pdf.setFontSize(11);
  pdf.text(`Sub Total: ${rupee}${order.subTotal}`, pageWidth - 60, finalY);
  pdf.text(`Tax: ${rupee}${order.taxAmount}`, pageWidth - 60, finalY + 7);
  pdf.text(`Discount: ${rupee}${order.discountAmount}`, pageWidth - 60, finalY + 14);
  pdf.text(`Coupon: ${rupee}${order.couponAmount}`, pageWidth - 60, finalY + 21);

  pdf.setFont('helvetica', 'bold');
  pdf.text(`Grand Total: ${rupee}${order.grandTotal}`, pageWidth - 60, finalY + 38);
const grandTotalWords = this.numberToWords(Math.round(order.grandTotal));
pdf.setFont('helvetica', 'normal');

const splitWords = pdf.splitTextToSize(
  `Amount in Words: ${grandTotalWords}`,
  pageWidth - 28
);

pdf.text(splitWords, 14, finalY + 50);
  /* =========================
     FOOTER
  ==========================*/

  pdf.setFontSize(9);
  pdf.setFont('helvetica', 'normal');
  pdf.text(
    'Thank you for your business!',
    pageWidth / 2,
    pageHeight - 10,
    { align: 'center' }
  );

  pdf.save(`Invoice_${order.orderCode}.pdf`);
}
}