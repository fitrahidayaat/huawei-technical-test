// Interface for form data
export interface FormData {
  id: string;
  name: string;
  email: string;
  message: string;
  createdAt: Date;
}

// Simple data storage using array
class FormStorage {
  private forms: FormData[] = [];

  // Add new form data
  addForm(form: Omit<FormData, 'id' | 'createdAt'>): FormData {
    const newForm: FormData = {
      ...form,
      id: Date.now().toString(),
      createdAt: new Date()
    };
    
    this.forms.push(newForm);
    return newForm;
  }

  // Get all form data
  getAllForms(): FormData[] {
    return this.forms;
  }

  // Get form data by ID
  getFormById(id: string): FormData | undefined {
    return this.forms.find(form => form.id === id);
  }
}

// Export singleton instance of FormStorage
export const formStorage = new FormStorage();