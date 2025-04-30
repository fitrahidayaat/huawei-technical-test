import express, { Request, Response, Router } from "express";
import { formStorage, FormData } from "../models/form";

const router: Router = express.Router();

// Endpoint to get all form data
router.get("/forms", (req: Request, res: Response) => {
  const forms: FormData[] = formStorage.getAllForms();
  res.json({
    success: true,
    data: forms,
  });
});

// Endpoint to get form data by ID
router.get("/forms/:id", (req: Request, res: Response) => {
  const { id } = req.params;
  const form: FormData | undefined = formStorage.getFormById(id);

  if (!form) {
    res.status(404).json({
      success: false,
      message: "Form not found",
    });
  }

  res.json({
    success: true,
    data: form,
  });
});

// Endpoint to add new form data
router.post("/forms", (req: Request, res: Response) => {
  const { name, email, message } = req.body;

  // Data validation
  if (!name || !email || !message) {
    res.status(400).json({
      success: false,
      message: "Name, email, and message are required",
    });
  }

  // Add new form data
  const newForm = formStorage.addForm({ name, email, message });

  res.status(201).json({
    success: true,
    data: newForm,
  });
});

export default router;
