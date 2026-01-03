import { Component, ViewChildren, QueryList, ElementRef, inject, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ApiService, ShareEstimationDto } from '../services/api.service';
import { ToastService } from '../services/toastService.service';

const materialsConfig = {
  Services: {
    'air conditioner':[
  'Brand Visit Charges',
  'Onsite Service Charge',
  'Service / Inspection Charge',
  'Facilitation Charges',
  'Weekend Incentive',
  'AC Dry Service',
  'AC Wet Service',
  'AC Deep Cleaning',
  'Indoor Unit Cleaning',
  'Outdoor Unit Cleaning',
  'AC Installation (Split AC)',
  'AC Uninstallation',
  'AC Re-Installation',
  'Window AC Installation',
  'Window AC Uninstallation',
  'AC Onsite Repair',
  'AC Offsite Repair',
  'Cooling Issue Repair',
  'Noise Issue Repair',
  'Water Leakage Repair'],
    'water purifier': [],
    'ice cube machine': [],
    'refrigerator': [
 'Refrigerator below 400 ltrs onsite repair',
'Brand visit charges',
'Refrigerator below 400 ltrs servicing / visiting charge',
'Facilitation Charges',
'Refrigerator above 500 ltrs Installation',
'Onsite service charge',
'Service charge',
'Refrigerator above 500 ltrs onsite repair',
'Weekend Incentive',
'Refrigerator 400 ltrs to 500 ltrs Installation',
'Gasket',
'Refrigerator above 500 ltrs offsite repair',
'Refrigerator 400 ltrs to 500 ltrs onsite repair',
'Brand Service Charge',
'Labour Charge',
'Transportation Charges',
'Refrigerator below 400 ltrs offsite repair',
'Compressor PCB replace charges',
'Refrigerator Deep Cleaning',
'Refrigerator 400 ltrs to 500 ltrs servicing / visiting charge'
    ],
    'washing machine': [
      'Brand Visit Charges',
'Onsite Service Charge',
'Service / Inspection Charges',
'Facilitation Charges',
'Weekend Incentive',
'Washing Machine Dry Service',
'Washing Machine Wet Service',
'Washing Machine Deep Cleaning',
'Drum Cleaning',
'Filter Cleaning',
'Washing Machine Onsite Repair',
'Washing Machine Offsite Repair',
'Noise / Vibration Issue Repair',
'Water Leakage Repair',
'Spin / Dry Issue Repair',
'Power Issue Repair',
'Door Lock Issue Repair',
'Washing Machine Installation',
'Washing Machine Uninstallation',
'Washing Machine Re-Installation',
'Labour Charges',
'Electrical Work Charges',
'Wiring / Minor Electrical Repair',
'Transportation Charges',
'Stand / Base Adjustment Charges',
'Extra Work Charges'
    ],
   'other': [
    'Service Charges',
    'Installation Charges',
    'Transportantion'
   ]
  },
  'Spare Parts': {
    'air conditioner':[
  'Gas Checking Charges',
  'Gas Top-Up Charges',
  'Full Gas Charging Charges',
  'Vacuuming Charges',
  'PCB (Indoor PCB)',
  'Outdoor PCB',
  'Inverter PCB',
  'Display PCB',
  'Control Box',
  'Capacitor (Indoor)',
  'Capacitor (Outdoor)',
  'Relay',
  'Transformer',
  'Room Temperature Sensor',
  'Coil Sensor',
  'Outdoor Sensor',
  'Thermostat',
  'Indoor Fan Motor',
  'Outdoor Fan Motor',
  'Blower / Cross Flow Fan',
  'Fan Blade',
  'Compressor',
  'Condenser Coil',
  'Evaporator Coil',
  'Discharge Pipe',
  'Suction Pipe',
  'Capillary Tube',
  'Filter Drier',
  'Refrigerant Gas (R22 / R32 / R410)',
  'Gas Charging',
  'Gas Leakage Repair Kit',
  'Valve / Service Valve',
  'Drain Pipe',
  'Drain Tray',
  'Water Pump',
  'Indoor Front Panel',
  'Indoor Grill',
  'Outdoor Cover',
  'Swing Flap / Louver',
  'Wiring Harness',
  'Power Cord',
  'Connector',
  'Insulation Tape',
  'Nut Bolt Set',
  'Copper Pipe (Per Meter)',
  'Insulation Pipe',
  'Drain Pipe (Flexible)',
  'Wall Sleeve',
  'Clamp / Stand'],
    'water purifier': [],
    'ice cube machine': [],
    'refrigerator': [
      'Reserve Valve Convertable',
'Panel',
'Holder',
'Thermostat',
'Motor',
'Fan Motor',
'ASSY SHELF GLASS REF SHELF',
'Discharge Coil',
'Inverter Board',
'Gas Charging',
'Hot Lock Pipe',
'Control Box',
'Temperature Sensor',
'Complete Fan Set',
'Tray',
'Wiring',
'Water Valve',
'Lock Bracket',
'Gas Charging (duplicate option – system me do baar dikh raha hai)',
'GAS KIT'
    ],
    'washing machine': [
      'Main PCB',
  'Display PCB',
  'Inverter PCB',
  'Control Panel',
  'Power Cord',
  'Noise Filter',
  'Motor',
  'Motor Capacitor',
  'Clutch',
  'Gear Box',
  'Belt / Drive Belt',
  'Pulley',
  'Water Inlet Valve',
  'Drain Pump',
  'Drain Motor',
  'Pressure Switch',
  'Drain Hose',
  'Inlet Hose',
  'Door Lock',
  'Door Switch',
  'Lid Switch',
  'Door Handle',
  'Door Glass',
  'Inner Drum',
  'Outer Tub',
  'Drum Shaft',
  'Spider Arm',
  'Bearing',
  'Oil Seal',
  'Temperature Sensor',
  'Float Switch',
  'Overflow Sensor',
  'Front Panel',
  'Top Cover',
  'Knob / Selector Switch',
  'Soap Dispenser',
  'Lint Filter',
  'Wiring Harness',
  'Connector',
  'Clamp',
  'Spring',
  'Nut Bolt Set',
  'Machine Stand',
  'Anti-Vibration Pad',
  'Rubber Foot'
    ],
    'other': [
      'Part Required'
    ]
  }
} as const;

type MaterialType = keyof typeof materialsConfig; 

@Component({
  selector: 'app-share-estimation',
  templateUrl: './share-estimation.html',
  styleUrls: ['./share-estimation.css'],
  imports: [
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatIconModule,
    MatButtonModule,
    MatRadioModule,
    CommonModule,
    ReactiveFormsModule,
    MatDialogModule
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]  
})
export class ShareEstimationComponent {

  @ViewChildren("fileInputs") fileInputs!: QueryList<ElementRef<HTMLInputElement>>;

  materialList: string[] = [];
  

  shareForm!: FormGroup;
  isSubmitting = false;
  private apiService = inject(ApiService);
   private toast = inject(ToastService);
  private data = inject(MAT_DIALOG_DATA) as { claimId: number, claimCategory: string };
  claimId = this.data.claimId;
  claimCategory = this.data.claimCategory;
  isLoading = false;

  constructor(
    private fb: FormBuilder,
    public dialogRef: MatDialogRef<ShareEstimationComponent>
  ) {
    this.shareForm = this.fb.group({
      items: this.fb.array([]),
      observation: ['', Validators.required],
      claimType: ['', Validators.required],
      symptom: ['', Validators.required],
      remarks: [''],
      imagesArray: this.fb.array([])
    });

    this.addRow();
  }

  ngOnInit() {   

    this.addImage("Upload image");
    this.addImage("Upload image", true);
    this.addImage("Upload image", true);
  }

  get items(): FormArray { return this.shareForm.get('items') as FormArray; }
  get imagesArray(): FormArray { return this.shareForm.get('imagesArray') as FormArray; }

  addImage(label: string, required = false) {
    this.imagesArray.push(this.fb.group({
      label,
      required,
      file: null,
      fileName: '',
      previewUrl: ''
    }));
  }

  triggerFile(index: number) {
    const inputList = this.fileInputs.toArray();
    inputList[index]?.nativeElement.click();
  }

  onSelectImage(event: any, index: number) {
    const file = event.target.files[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = () => {
      this.imagesArray.at(index).patchValue({
        file,
        fileName: file.name,
        previewUrl: reader.result
      });
    };
    reader.readAsDataURL(file);
  }

  addRow() {
    const row =this.fb.group({
        type: ['Select', Validators.required],
        material: ['', Validators.required],
        hsn: ['', Validators.required],
        price: [0, [Validators.required, Validators.min(1)]],
        tax: [18, Validators.required],
        removable: [this.items.length > 0]
      })
    this.items.push(row);

    type ServiceType = keyof typeof materialsConfig;

type ApplianceType<T extends ServiceType> =  keyof typeof materialsConfig[T];    
    const index = this.items.length - 1;
    row.get('type')?.valueChanges.subscribe((typ: string | null) => {
      this.shareForm.get('material')?.setValue('');
      const type = typ as MaterialType;
      if (!type || !this.claimCategory) {
  this.materialList = [];
  return;
}

      let categoryKey = this.normalize(this.claimCategory);
      if(!(categoryKey in materialsConfig[type]))
      {
        categoryKey = 'other';
      }
      if (categoryKey in materialsConfig[type]) {
        this.materialList = 
  this.materialList = [
    ...materialsConfig[type][categoryKey as keyof typeof materialsConfig[typeof type]
    ] ?? materialsConfig[type].other
  ].sort();
} else {
  this.materialList = [];
}
    });
  }

  normalize(value: string): string {
  return value.trim().toLowerCase();
}
  removeRow(i: number) {
    if (this.items.at(i).get('removable')?.value) this.items.removeAt(i);
  }

  isLastRowValid(): boolean {
    return this.items.length > 0 && this.items.at(this.items.length - 1).valid;
  }

  getTaxAmount(i: number): number {
    const item = this.items.at(i).value;
    return (item.price * item.tax) / 100;
  }

  getTotal(i: number): number {
    const item = this.items.at(i).value;
    return item.price + this.getTaxAmount(i);
  }

  getGrandTotal(): number {
    //return this.items.controls.map((_, i) => this.getTotal(i)).reduce((a, b) => a + b, 0);
    return +(
      this.items.controls
        .map((_, i) => this.getTotal(i))
        .reduce((a, b) => a + b, 0)
    ).toFixed(2);
  }

shareEstimate() {
  if (this.shareForm.invalid) {
    this.shareForm.markAllAsTouched();
    return;
  }

  const formData = new FormData();
  formData.append('ClaimId', this.claimId.toString());
  formData.append('Observation', this.shareForm.value.observation);
  formData.append('ClaimType', this.shareForm.value.claimType);
  formData.append('Symptom', this.shareForm.value.symptom);
  formData.append('Remarks', this.shareForm.value.remarks || '');

  this.items.controls.forEach((item, index) => {
    formData.append(`Items[${index}].Type`, item.value.type);
    formData.append(`Items[${index}].Material`, item.value.material);
    formData.append(`Items[${index}].HSNCode`, item.value.hsn.toString());
    formData.append(`Items[${index}].Price`, item.value.price.toString());
    formData.append(`Items[${index}].TaxPercent`, item.value.tax.toString());
  });

this.imagesArray.controls.forEach(ctrl => {
  if (ctrl.value.file) {
    formData.append('Images', ctrl.value.file, ctrl.value.file.name);
  }
});

  this.isSubmitting = true;
  this.isLoading = true;
  this.apiService.updateShareEstimation(formData).subscribe({
    next: res => {
      this.toast.success('Estimation shared successfully.!');
      this.dialogRef.close('success');
      this.isSubmitting = false;
      this.isLoading = false;
    },
    error: err => {  this.toast.error('Something went wrong!');
     this.isSubmitting = false;
     this.isLoading = false;
    }
  });
}
 onClose() { this.dialogRef.close(); }

}
